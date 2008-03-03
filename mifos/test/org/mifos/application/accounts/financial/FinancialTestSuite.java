package org.mifos.application.accounts.financial;

import junit.framework.Test;
import junit.framework.TestSuite;
import junit.textui.TestRunner;

import org.mifos.application.accounts.financial.business.TestCOABO;
import org.mifos.application.accounts.financial.business.TestFinancialBO;
import org.mifos.application.accounts.financial.util.helpers.ChartOfAccountsCacheTest;
import org.mifos.application.accounts.financial.util.helpers.TestFinancialActionCache;
import org.mifos.application.accounts.financial.util.helpers.TestFinancialActionConstants;
import org.mifos.application.accounts.financial.util.helpers.TestFinancialInitializer;
import org.mifos.application.accounts.financial.util.helpers.TestFinancialRules;

public class FinancialTestSuite extends TestSuite {
	
	public FinancialTestSuite() throws Exception {
		super();
	}
	public static void main (String[] args)throws Exception
	{
		Test testSuite = suite();
		
		TestRunner.run (testSuite);
	}
	public static Test suite() throws Exception
	{
		TestSuite testSuite = new FinancialTestSuite();
		testSuite.addTestSuite(TestFinancialActionCache.class);
		testSuite.addTest(TestFinancialInitializer.suite());
		testSuite.addTest(ChartOfAccountsCacheTest.suite());
		testSuite.addTest(TestFinancialRules.testSuite());
		testSuite.addTestSuite(TestCOABO.class);
		testSuite.addTestSuite(TestFinancialBO.class);
		testSuite.addTest(TestFinancialActionConstants.suite());

		return testSuite;
		
	}

}
