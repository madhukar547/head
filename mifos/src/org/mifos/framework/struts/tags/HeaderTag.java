/**

 * HeaderTag.java    version: xxx

 

 * Copyright (c) 2005-2006 Grameen Foundation USA

 * 1029 Vermont Avenue, NW, Suite 400, Washington DC 20005

 * All rights reserved.

 

 * Apache License 
 * Copyright (c) 2005-2006 Grameen Foundation USA 
 * 

 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
 *

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the 

 * License. 
 * 
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an explanation of the license 

 * and how it is applied. 

 *

 */

package org.mifos.framework.struts.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.mifos.framework.business.BusinessObject;
import org.mifos.framework.components.taggenerator.TagGenerator;
import org.mifos.framework.exceptions.PageExpiredException;
import org.mifos.framework.util.helpers.Constants;
import org.mifos.framework.util.helpers.SessionUtils;

/**
 * This tag class is used to display header links on the top of the jsp page.
 */
public class HeaderTag extends TagSupport {
	private String selfLink;

	public HeaderTag() {
		super();
	}
	
	public String getSelfLink() {
		return selfLink;
	}
	
	public void setSelfLink(String selfLink) {
		this.selfLink = selfLink;
	}
	
	@Override
	public int doStartTag() throws JspException {
		BusinessObject obj=null;
		Object randomNum = pageContext.getSession().getAttribute("randomNUm");
		try {
			obj = (BusinessObject)SessionUtils.getAttribute(Constants.BUSINESS_KEY,(HttpServletRequest)pageContext.getRequest());
		} catch (PageExpiredException pex) {
			obj=(BusinessObject)pageContext.getSession().getAttribute(Constants.BUSINESS_KEY);
		}
			
		String linkStr;
		if(selfLink!=null && selfLink!="")
			linkStr = TagGenerator.createHeaderLinks(obj,Boolean.getBoolean(selfLink),randomNum);
		else
			linkStr = TagGenerator.createHeaderLinks(obj,true,randomNum);
		try {
			pageContext.getOut().write(linkStr);
		}catch (IOException e) {
			new JspException(e);
		}
		return SKIP_BODY;
	}
}
