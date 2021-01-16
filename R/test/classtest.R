


Die = list(history = character(0))

# append(1:5, 0:1, after = 3)

class(Die) = "Die"
class(Die)= append(class(Die), "Die")
class(Die)
append(class(Die), "Die")

Die$history = c('1', '2')
Die

reset = function(theObject) {
  UseMethod("reset", theObject)
}

Die = reset(Die)

reset.Die = function(theObject){
  theObject$history = character(0)
  return(theObject)
}
