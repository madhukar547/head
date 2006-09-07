package org.mifos.application.customer.group.business.service;

import org.mifos.application.customer.group.business.GroupBO;
import org.mifos.application.customer.group.persistence.GroupPersistence;
import org.mifos.framework.business.BusinessObject;
import org.mifos.framework.business.service.BusinessService;
import org.mifos.framework.exceptions.PersistenceException;
import org.mifos.framework.exceptions.ServiceException;
import org.mifos.framework.security.util.UserContext;

public class GroupBusinessService extends BusinessService {

	@Override
	public BusinessObject getBusinessObject(UserContext userContext) {
		return null;
	}
	
	public GroupBO getGroupBySystemId(String globalCustNum){
		return new GroupPersistence().getGroupBySystemId(globalCustNum);
	}
	
	public GroupBO getGroup(Integer customerId) throws ServiceException{
		try{
			return new GroupPersistence().geGroup(customerId);
		}catch(PersistenceException pe){
			throw new ServiceException(pe);
		}
	}
}
