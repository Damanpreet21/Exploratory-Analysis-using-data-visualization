wine_db
wine_db$description

citrus <- c('lime','lemon','grapefruit','orange','marmalade','citrus')
floral <- c('iris','peony','elderflower','acacia','lilac','jasmine','honeysuckle','violet','lavender','rose','potpourri','hibiscus','floral')
treeFruit <- c('quince','apple','pear','nectarine','peach','apricot','persimmon')
tropicalFruit <- c('pineapple','mango','guava','kiwi','lychee','tropical')
redFruit <- c('cranberry','pomegranate','cherry','strawberry','raspberry')
blackFruit <- c('boysenberry','currant','plum','blackberry','blueberry','olive')
spice <- c('pepper','cinnamon','anise','fennel','eucayptus','mint','thyme','sage','spice')
earthy <- c('petroleum','volcanic','beet','soil','gravel','slate','clay','earth','earthy')
oak <- c('dill','smoke','cigar','baking','coconut','vanilla','^oak$')
aged <- c('leather','cocoa','coffee','tabacco','nuts')
microbial <- c('mushroom','truffle','lager','sourdough','cream','butter')


flavor_Citrus <- ifelse(grepl(citrus,wine_data$description),'Citrus, ', "")
flavor_floral <- ifelse(grepl(floral,wine_data$description),"Floral, ", "")
flavor_tropicalFruit = ifelse(grepl(tropicalFruit,wine_data$description),"Tropical Fruit(s), ", "")
flavor_redFruit = ifelse(grepl(redFruit,wine_data$description),"Red Fruit(s), ", "")
flavor_blackFruit = ifelse(grepl(blackFruit,wine_data$description),"Black Fruit(s), ", "")
flavor_spice = ifelse(grepl(spice,wine_data$description),"Spice(s), ", "")
flavor_earthy = ifelse(grepl(earthy,wine_data$description),"Earthy, ", "")
flavor_oak = ifelse(grepl(oak,wine_data$description),"Oak Aging, ", "")
flavor_aged = ifelse(grepl(aged,wine_data$description),"Aging Flavors, ", "")
flavor_microbial = ifelse(grepl(microbial,wine_data$description),"Microbials, ", "")

wine_db$flavorProfile <- c(paste(flavor_floral, flavor_Citrus, flavor_tropicalFruit, flavor_redFruit, flavor_blackFruit, flavor_spice,flavor_earthy, flavor_oak, flavor_aged, flavor_microbial))


wine_db$flavorComplexity <- count.fields(textConnection(wine_db$flavorProfile), sep = ",")-1
write.csv(wine_db, file = "Wine_db_updated.csv")

################


