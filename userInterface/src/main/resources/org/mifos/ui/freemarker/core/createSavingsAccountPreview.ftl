[#ftl]
[#--
* Copyright (c) 2005-2010 Grameen Foundation USA
*  All rights reserved.
*
*  Licensed under the Apache License, Version 2.0 (the "License");
*  you may not use this file except in compliance with the License.
*  You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS,
*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
*  implied. See the License for the specific language governing
*  permissions and limitations under the License.
*
*  See also http://www.apache.org/licenses/LICENSE-2.0.html for an
*  explanation of the license and how it is applied.
--]

[@layout.webflow currentState="createSavingsAccount.flowState.reviewAndSubmit" 
                 states=["createSavingsAccount.flowState.selectCustomer", 
                 		 "createSavingsAccount.flowState.enterAccountInfo", 
                 		 "createSavingsAccount.flowState.reviewAndSubmit"]] 

<h1>[@spring.message "createSavingsAccount.preview.pageTitle" /] - <span class="standout">[@spring.message "createSavingsAccount.preview.pageSubtitle" /]</span></h1>
<p>[@spring.message "createSavingsAccount.preview.instructions" /]</p>
<br/>

<p><span class="standout">[@spring.message "createSavingsAccount.preview.accountOwnerName" /]</span> ${savingsAccountFormBean.customer.displayName}</p>
<br/>

<p class="standout">[@spring.message "createSavingsAccount.preview.productSummary.header" /]</p>
<br/>

<div class="summary">
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.savingsInstanceName" /]</div>
		<div class="value">${savingsAccountFormBean.product.savingsProductDetails.productDetails.name}</div>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row divider">[@spring.message "createSavingsAccount.preview.instanceInfo" /]</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.description"/]</div>
		<div class="value">${savingsAccountFormBean.product.savingsProductDetails.productDetails.description}</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.typeOfDeposits"/]</div>
		<div class="value">[@lookup.fromMap savingsAccountFormBean.savingsTypes savingsAccountFormBean.product.savingsProductDetails.depositType?string /]</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.maxWithdrawalAmount"/]</div>
		<div class="value">${savingsAccountFormBean.product.savingsProductDetails.maxWithdrawal}</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.balanceForInterestCalculation"/]</div>
		<div class="value">[@lookup.fromList savingsAccountFormBean.product.interestCalcTypeOptions savingsAccountFormBean.product.savingsProductDetails.interestCalculationType?string /]</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.periodForInterestCalculation"/]</div>
		<div class="value">
			${savingsAccountFormBean.product.savingsProductDetails.interestCalculationFrequency}
			[@lookup.fromMap savingsAccountFormBean.recurrenceFrequencies savingsAccountFormBean.product.savingsProductDetails.interestCalculationFrequencyPeriod?string /]
		</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.interestPostingFrequency"/]</div>
		<div class="value">
			${savingsAccountFormBean.product.savingsProductDetails.interestPostingMonthlyFrequency}
			[@lookup.recurringFrequencyMonth /]
		</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.minBalanceForInterestCalculation"/]</div>
		<div class="value">${savingsAccountFormBean.product.savingsProductDetails.minBalanceForInterestCalculation}</div>
	</div>
	<div class="row">
		<div class="attribute">[@spring.message "createSavingsAccount.preview.productSummary.interestRate"/]</div>
		<div class="value">${savingsAccountFormBean.product.savingsProductDetails.interestRate} %</div>
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">
		[#if savingsAccountFormBean.product.savingsProductDetails.depositType?string == "1"]
			<div class="attribute">[@spring.message "createSavingsAccount.preview.savingAccountDetail.depositAmount.mandatory" /]</div>
			<div class="value">${savingsAccountFormBean.mandatoryDepositAmount ! "0"}</div>
		[#elseif savingsAccountFormBean.product.savingsProductDetails.depositType?string == "2"]
			<div class="attribute">[@spring.message "createSavingsAccount.preview.savingAccountDetail.depositAmount.voluntary" /]</div>
			<div class="value">${savingsAccountFormBean.voluntaryDepositAmount ! "0"}</div>
		[/#if]
	</div>
	<div class="row">&nbsp;</div>
	<div class="row">
		<form action="${flowExecutionUrl}" method="post">
			<input type="submit" class="edit" value="Edit Savings account information" name="_eventId_edit" />
		</form>
	</div>
	<div class="clear"/>
</div>
<br/>
<form action="${flowExecutionUrl}" method="post" class="webflow-controls centered">
	<div class="row">
		[@form.submitButton "createSavingsAccount.preview.saveForLaterButton" "saveForLater" /]
		[@form.submitButton "createSavingsAccount.preview.saveForApprovalButton" "saveForApproval" /]
		[@form.cancelButton "createSavingsAccount.preview.cancelButton" "cancel" /]
	</div>
</form>

[/@layout.webflow]
