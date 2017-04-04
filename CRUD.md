What is CRUD?


What is SQL?
 Give SQL examples for each CRUD action

Given a class Zoo
 ```ruby
 class Zoo
   include DataMapper::Resource

   property :id, Serial
   property :name, String
end
 ```

 We can create, save, update and destroy resources

 Insert
 ```SQL

 ```

 ```ruby
 zoo = Zoo.first_or_create(:name => 'The Glue Factory')
 ```

 Save
```SQL

```


 ```ruby
zoo = Zoo.new
zoo.attributes = { :name => 'The Glue Factory'}
zoo.save
 ```

 Update
 ```SQL

 ```
 
 ```ruby

 ```
