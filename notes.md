# Graphql notes and observations

1. “enum values are passed in all uppercase letters; the value macro”.
2. Los argumentos pueden ser definidos como tipos custom y ser rehusados entre otros queries.
3. Tenemos que seguir los estandares de Graphql (camelCase) porque JS :( Absinthe ayuda con eso
   pero si respetamos los estandares es más comun y no nos odiará la gente que ya sabe y usa GraphQL.
4. En un query al agregar un signo de admiración (!) comunicamos que la variable es obligatoria.
5. Input object types, unlike normal object types, do not support circular references. You can’t have two input types that refer to each other, either directly or through an intermediary
6. “custom scalar type gives us the capability to keep our business logic clean and simple by isolating any parsing (and validation) logic inside the scalar type definition itself, while clarifying the date and time input and output formats that we support for our users.”



## Questions
1. Cómo podemos tener ejemplos y descripciones de los schemas?
    1.1 Postman puede ser una buena opción, podría hacer un ejemplo y mostrarlo :) #ganandoselachuleta


