# TimesLon
Example to create a simple Android App using Ceylon Lang 

## Requirements 
* Ceylon 1.3.x
* Intellij Plugin 
* Android Studio 


### Union Types 

Using union types can create a single response from server 
```
void response ( Anything(Error | Response? ) response);

```

### Mixin Inheritance

Using interface to be able create interfaces with methods without implementatio or implement methods
```
shared interface View {
  shared void printError(String message);
  shared void showResult(Result result) {
    print(result.string);
  }
}
```

### Object declaration
Be able to object declaration to create a simple server config
```
shared object serverconfig {
    shared String baseUrl = "https://androidrules.com"
}
```

### Callable Functions 

Be able to create callable functions to replace callback interfaces
```
  function response(Response) => print(response.string);
```



