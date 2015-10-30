# Creating a barebones Rails app

* https://gist.github.com/thewoolleyman/88ef11961e54ce04b337

# Neography

* Setup: https://github.com/maxdemarzi/neography
* Wiki: https://github.com/maxdemarzi/neography/wiki

# Creating node data:
```
rails c

@neo = Neography::Rest.new

@neo.set_node_auto_index_status(true)
@neo.add_node_auto_index_property('sha')

@neo.batch([:create_node, {'sha' => 'abc1'}])
@neo.batch([:create_node, {'sha' => 'abc2'}])
@neo.batch([:create_node, {'sha' => 'abc3'}])
@neo.batch([:create_node, {'sha' => 'def1'}])

abc1_id = @neo.get_node_auto_index('sha','abc1')[0]['metadata']['id']
abc2_id = @neo.get_node_auto_index('sha','abc2')[0]['metadata']['id']
abc3_id = @neo.get_node_auto_index('sha','abc3')[0]['metadata']['id']
def1_id = @neo.get_node_auto_index('sha','def1')[0]['metadata']['id']

@neo.create_relationship('parent', abc3_id,abc2_id)
@neo.create_relationship('parent', abc2_id,abc1_id)

@neo.create_relationship('parent', abc3_id,def1_id)
@neo.create_relationship('parent', def1_id,abc1_id)

```

# Visualizing Data

* http://neographytest.sb02.stations.graphenedb.com:24789/browser/
* MATCH (n) RETURN n LIMIT 100
* Limit nodes -> Click "Star" -> Graph Style Sheet -> Drag in graphstyle.grass which has caption set to sha

![Graph Visualization](https://raw.githubusercontent.com/thewoolleyman/neography-test/master/graph_visualization.png)
