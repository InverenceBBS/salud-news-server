# salud-news-server
The code for the server for managing, collection, and formatting, and storing of news data for the Salud Domain.
<!-- 
# Functioning
The endpoint for getting news articles for a particular keyword, date, language, location, ... is live  here `{url_webserver}/news/query`. The `{url_webserver}` can be read on the top right corner of the github repo (is not stable yet, as we might want a dedicated domain).
API docs are here `{url_webserver}/docs`.
There you also find a testing zone for a query.
An example query from the command line is as follows -->

<!-- ```bash
curl -v "https://absolute-newsapi-query-7d1dab937c32.herokuapp.com/news/query?keyword=o2&language=spa&location=Spain&date=y2023m11d01&followingdays=5&maxarticles=3"
``` -->

<!-- Which returns a result like this:

```json
[{"time":"13:08:56","dataType":"news","eventUri":null,"shares":{"facebook":6},"location":{"label":{"eng":"Málaga"},"type":"place","country":{"label":{"eng":"Spain"},"type":"country"}},"wgt":6,"isDuplicate":false,"sim":0,"body":"MÁLAGA, 2 Nov. (EUROPA PRESS) -\n\nEl Área de Deporte del Ayuntamiento de Málaga vuelve a apoyar la actividad '24 horas. Enciende la llama', que organiza la ONG Manos Unidas.\n\nEl concejal delegado de Deporte, Borja Vivas, ha presentado este jueves esta iniciativa que alcanza su undécima edición acompañado por el diputado de Deportes, Juan Rosas, y la presidenta de Manos Unidas en Málaga y Melilla, Ana Torralba.\n\nCon la frase 'Enciende tu compromiso', esta iniciativa de sensibilización se desarrollará con el mismo objetivo que en años anteriores: iluminar virtualmente el mundo para acabar, juntos, con las \"partes ensombrecidas\" que éste tiene, causadas por el hambre, las desigualdades y las injusticias que siguen existiendo hoy en día, y contra las que Manos Unidas lucha desde hace 63 años.\n\nLa acción consiste en el encendido de una vela en cualquiera de 16 centros deportivos de la ciudad que se van a implicar entre el 6 y el 12 de noviembre.\n\nCualquier persona puede sumarse a la XI edición de las '24 horas' de Manos Unidas con su foto para 'Enciende la Llama'. La forma de hacer llegar su foto es subirla directamente, a partir del 3 de noviembre, a la página web de la iniciativa: http://www.manosunidas.org/24horas. A partir del 11 de noviembre las velas se podrán ver en el mapa interactivo.\n\nIgualmente, la página web irá mostrando cómo el mapa del mundo se va iluminando con las fotografías que van llegando desde muchos lugares del planeta, formando parte, un año más, de la seña de identidad de la iniciativa: la acción 'Enciende la llama'.\n\n\"Es una acción sencilla, accesible a todos, que mediante un gesto (la toma de una fotografía con una vela encendida) busca ofrecer a la sociedad la forma de mostrar, de manera activa, su solidaridad con los países del Sur y con las personas que en ellos viven\", han señalado.\n\nLos gimnasios y centros en los que van a estar las '24 horas para iluminar el mundo' son Forus Trinidad, Forus El Torcal, Forus Conde de Guadalhorce, O2 Centro Welness El Perchel, Centro Acuático Inacua, Vals sport Churriana, Vals sport El Cónsul, Vals sport Ciudad Jardín, Vals sport Teatinos, Go Fit Segalerva, Go Fit Huellin, David Lloyd,, Polideportivo Ciudad Jardín, Club Mediterráneo, Pabellón de Deportes de la UMA y Real Club de Golf Guadalhorce.","image":"https://img.europapress.es/fotoweb/fotonoticia_20231102140152_1200.jpg","sentiment":null,"date":"2023-11-02","url":"https://www.europapress.es/andalucia/malaga-00356/noticia-centros-deportivos-malaga-suman-24-horas-enciende-llama-manos-unidas-20231102140152.html","uri":"7814621326","relevance":2,"dateTimePub":"2023-11-02T13:01:52Z","source":{"uri":"europapress.es","dataType":"news","title":"europa press"},"lang":"spa","title":"Centros deportivos de Málaga se suman a 24 horas. Enciende la llama'...","dateTime":"2023-11-02T13:08:56Z","authors":[]}]
```

### Composite keywords

Note: if you use `curl` or an equivalent tool, remember to parse the query url properly. Importantly, if you have a white space in the midst of the keyword string (such as in `"o2 iphone"`), subtistute the white space with `%20` (urls don't cope well with white spaces).
On the other hand, if you use the website interface (the one in `/docs`) to test your queries, the website will take care of that automatically.

## Deployment

The web server is launched from the `Server.jl` script.
The script accepts one input, namely the `PORT` on which to serve.
The variable `PORT` is defined by Heroku.

## API logic

The endpoint are developed in `/src` and included in the `Server.jl`.
Endpoint logic is described as swagger markdown.
**Warning** formatting errors in the docs BREAK the server, so experiment on local first!
Always refer to the [Swagger's OpenAPI documentation](https://swagger.io/docs/specification/).

## Building process

The webserver is built using an ad hoc buildpack for Julia we maintain [here](https://github.com/Baffelan/heroku-buildpack-julia/).
This compiles a sysimage of Julia and the necessary packages so that start up is faster. -->
