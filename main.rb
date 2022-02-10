require_relative "market"
require_relative "template"

#Instanciamos la clase Markets
markets = Markets.new

#Obtenemos los datos para los mercados
markets.getMarketsData 

#Generamos el HTML
template = Template.new
html = ERB.new(template.getTemplate)
html.run(markets.get_binding)

