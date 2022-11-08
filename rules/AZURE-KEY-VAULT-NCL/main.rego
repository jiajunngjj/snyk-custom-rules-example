package rules


import data.lib                                                                     
                                                                                    
deny[msg] {                                                                         
    resource := input.resource.azurerm_key_vault[name]                              
    network_acls := lib.normalize_to_array(resource.network_acls)                   
    acl := network_acls[_]                                                          
    acl.default_action == "Allow"                                                   
                                                                                                                                                                                                                           
    msg := {                                                                        
        # Mandatory fields                                                          
        "publicId": "KEYVAULT",                                                     
        "title": "default action in network_acls is set to Allow",                  
        "severity": "high",                                                         
        "msg": sprintf("input.resource.azurerm_key_vault[%s].network_acls.default_action", [name]),                                                                                                             
        # Optional fields                                                           
        "issue": "",
        "impact": "",
        "remediation": "",
        "references": [],                                                           
    }                                                                               
}

