param Location string = resourceGroup().location
param FirewallPolicyName string
param RuleCollectionGroups array = []

module deployFirewallPolicy 'br/public:avm/res/network/firewall-policy:0.2.0' = {
  name: 'deployFirewallPolicy'
  params: {
    name: FirewallPolicyName
    location: Location
    tier: 'Premium'
    threatIntelMode: 'Alert'
    ruleCollectionGroups: [for item in RuleCollectionGroups: {
      name: item.Name
      priority: item.Priority
      ruleCollections: item.RuleCollections
    }]
    enableProxy: true
  }
}
