/*
 * Copyright (c) 2005-2009 Grameen Foundation USA
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 * explanation of the license and how it is applied.
 */

package org.mifos.accounts.api;

import java.util.ArrayList;
import java.util.List;

import org.mifos.api.accounts.AccountPaymentParametersDto;
import org.mifos.api.accounts.AccountReferenceDto;
import org.mifos.api.accounts.AccountService;
import org.mifos.api.accounts.InvalidPaymentReason;
import org.mifos.application.accounts.business.AccountBO;
import org.mifos.application.accounts.exceptions.AccountException;
import org.mifos.application.accounts.loan.business.LoanBO;
import org.mifos.application.accounts.loan.persistance.LoanPersistence;
import org.mifos.application.accounts.persistence.AccountPersistence;
import org.mifos.application.accounts.util.helpers.PaymentData;
import org.mifos.framework.exceptions.PersistenceException;
import org.mifos.framework.hibernate.helper.StaticHibernateUtil;
import org.mifos.framework.util.helpers.Money;

/**
 * A service class implementation to expose basic functions on loans. As an
 * external API, this class should not expose business objects, only DTOs.
 */
public class StandardAccountService implements AccountService {
    private AccountPersistence accountPersistence;
    private LoanPersistence loanPersistence;

    public StandardAccountService() {

    }

    public StandardAccountService(AccountPersistence accountPersistence, LoanPersistence loanPersistence) {
        this.accountPersistence = accountPersistence;
        this.loanPersistence = loanPersistence;
    }

    public LoanPersistence getLoanPersistence() {
        return this.loanPersistence;
    }

    public void setLoanPersistence(LoanPersistence loanPersistence) {
        this.loanPersistence = loanPersistence;
    }

    public AccountPersistence getAccountPersistence() {
        return this.accountPersistence;
    }

    public void setAccountPersistence(AccountPersistence accountPersistence) {
        this.accountPersistence = accountPersistence;
    }

    @Override
    public void makePayment(AccountPaymentParametersDto accountPaymentParametersDto) throws PersistenceException,
            AccountException {
        StaticHibernateUtil.startTransaction();
        makePaymentNoCommit(accountPaymentParametersDto);
        StaticHibernateUtil.commitTransaction();
    }

    @Override
    public void makePayments(List<AccountPaymentParametersDto> accountPaymentParametersDtoList)
            throws PersistenceException, AccountException {
        StaticHibernateUtil.startTransaction();
        for (AccountPaymentParametersDto accountPaymentParametersDTO : accountPaymentParametersDtoList) {
            makePaymentNoCommit(accountPaymentParametersDTO);
        }
        StaticHibernateUtil.commitTransaction();
    }

    public void makePaymentNoCommit(AccountPaymentParametersDto accountPaymentParametersDto)
            throws PersistenceException, AccountException {
        final int accountId = accountPaymentParametersDto.getAccount().getAccountId();
        final AccountBO account = getAccountPersistence().getAccount(accountId);
        List<InvalidPaymentReason> validationErrors = validatePayment(accountPaymentParametersDto);
        if (validationErrors.contains(InvalidPaymentReason.INVALID_DATE)) {
            throw new AccountException("errors.invalidTxndate");
        }

        Money amount = new Money(accountPaymentParametersDto.getPaymentAmount());

        PaymentData paymentData = account.createPaymentData(accountPaymentParametersDto.getUserMakingPayment().getUserId(),
                amount, accountPaymentParametersDto.getPaymentDate().toDateMidnight().toDate(), null, null,
                accountPaymentParametersDto.getPaymentType().getValue());
        paymentData.setComment(accountPaymentParametersDto.getComment());

        account.applyPayment(paymentData);

        getAccountPersistence().createOrUpdate(account);

    }

    @Override
    public AccountReferenceDto lookupLoanAccountReferenceFromExternalId(String externalId) throws PersistenceException {
        LoanBO loan = getLoanPersistence().findByExternalId(externalId);
        if (null == loan) {
            throw new PersistenceException("loan not found for external id " + externalId);
        }
        return new AccountReferenceDto(loan.getAccountId());
    }

    @Override
    public List<InvalidPaymentReason> validatePayment(AccountPaymentParametersDto payment) throws PersistenceException,
            AccountException {
        List<InvalidPaymentReason> errors = new ArrayList<InvalidPaymentReason>();
        AccountBO accountBo = getAccountPersistence().getAccount(payment.getAccount().getAccountId());
        if (!accountBo.isTrxnDateValid(payment.getPaymentDate().toDateMidnight().toDate())) {
            errors.add(InvalidPaymentReason.INVALID_DATE);
        }
        return errors;
    }

}
