package rules

import data.lib
import data.lib.testing

test_PRU_RULE_AKV_001 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.azurerm_key_vault[denied].network_acls.default_action"],
		"fixture": "denied.tf",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("PRU-RULE-AKV-001", "./rules/PRU-RULE-AKV-001/fixtures", test_cases)
}