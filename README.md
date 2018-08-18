#Datastorm
![]()
## Installation

You can install it as `pip install datastorm`

## Quickstart

First, let's import and declare a datastorm object:

```python
from datastorm.datastorm import DataStorm

datastorm = DataStorm("example-gcloud-project")
```
Where `example-gcloud-project` is the name of your Google Cloud Project.

If no project name is given it will attempt to get it from the environmental variable `DATASTORE_PROJECT_ID`.

### Define entity

To define an entity you have to create a class. Don't worry, this isn't a schema.

```python
class EntityName(datastorm.DSEntity): 
    __kind__ = "EntityName"
    
    foo = "bar"
    
```

In this Entity you have defined a default property `foo` with a default value of `"bar"`.
### Create entity
Creating is plain simple.

```python
e = EntityName("key-goes-here", foo="bar2", foo2=23)
e.save()

e.foo = "bar"
e.new_var = 2.03 #You can define new attributes on the fly

e.save()
```

### Simple query
Querying syntax is pretty straighforward.

```python
result = EntityName.query.filter(EntityName.foo == "bar").first()

result = EntityName.query.get("key-goes-here") # Fetch by key

for result in EntityName.query.all(): # .all() returns a generator
	do_stuff(result) # result is an EntityName object

```

### Delete
I'm running out of expressions to describe how dead simple things arround here are.

```python
e = EntityName.query.get("key-goes-here")

e.delete()
```

## Tests
For running the tests you'll need a [Datastore emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator).

You'll also need the `DATASTORE_EMULATOR_HOST` environmental variable set pointing to your datastore emulator address (port included). You can use `.env` files. 

The recommended command for running it is:
````gcloud beta emulators datastore start --consistency=1````

You can pass the tests with ````make test````

I know it seems a little bit complicated, I will work to try and make things easier in the futue. Pinky promise.