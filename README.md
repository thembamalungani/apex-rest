# apex-rest
<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
<br><br>
This is a simple framework to handle Salesforce custom rest api. Takes care of the low level details of defining logging, request sanitisation and allows you to focus on the details of your application. It gives you a clean consitent request handling flow and it is high extensible which allows for customisation for specific use cases.

# Usage

## 1. Define a rest resource handler
This class is the handler for the rest resource. The method handler class must extend `BaseHttpMethodHandler` or implement `IHttpMethodHandler`. The http method handler defines 2 methods: `complete` which is called when the request is processed succsessfully and `fail` which is called when the request failed to process for some reason.

```apex
public class OrdersCreateHandler extends BaseHttpMethodHandler {

    /**
     * OrdersCreateHandler default constructor
     */
    public OrdersCreateHandler() {}

    /**
     * Handles the http request by delegating the handling to the instance of IHttpMethodHandler
     * passed
     *
     * @param HttpRequest request
     * @return HttpResponse
     */
    public HttpResponse handle(HttpRequest request) {

        return new HttpResponse()
                    .setCode(200)
                    .setData('test data')
                    .setHeader('Context-Type', 'application/json');
    }

    /**
     * Called when the request is done processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public override void complete(HttpRequest request, HttpResponse response) {
      // Do something when request is done
    }

    /**
     * Called when the request failed processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public override void fail(HttpRequest request, HttpResponse response) {
      // Do something when request fail
    }
}
```

## 2. Define a request pre-processor
You would typically use this to perform some data sanitisation. The request pre-processor is optional but if defined, it should extend `BaseRequestPreprocessor` or implement `IRequestPreprocessor`. The naming of this is important. If you have a method handler named `OrdersCreateHandler` then you would need to name this `OrdersCreatePreprocessor` which the dispatcher will attempt to instantiated and call dynamically if it is defined.

```apex
public class BaseRequestPreprocessor implements IRequestPreprocessor {

    /**
     * Pre processes a requests
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    public override HttpRequest process(HttpRequest request) {
        // Do some data sanitisation
        return request;
    }
}
```

## 3. Define a request Context Setter
This is optional. The request context setter is used to set the response context. The context setter must extend `BaseResponseContextSetter` or implement `IResponseContextSetter`. You would typically use this to set custom response headers, response code, response data. The naming is important. If you named your method handler `OrdersCreateHandler`, then your context setter must be named `OrdersCreateResponseContextSetter` which will be instatiated and called dynamically if it is defined.

```apex
public class OrdersCreateResponseContextSetter implements IResponseContextSetter {

    /**
     * Sets the RestContext.response
     *
     * @param HttpResponse response
     */
    public override void setContext(HttpResponse response) {
        // Add some logic to set the response context
    }
}
```

## 4. Define a request logger
This is optional. If you would like to define some specific logging mechanism you can extend the class `BaseRequestLogger` or implment `IHttpRequestLogger`. The naming is important. If you have a method handler named `OrdersCreateHandler` then you must define a logger with name `OrdersCreateRequestLogger`.

```apex
public class OrdersCreateRequestLogger implements IHttpRequestLogger {

    /**
     * Logs a request
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public override void log(HttpRequest request, HttpResponse response) {
      // Add some logic to log the request
    }
}
```

## 5. Dispatch the method handler

```apex
@RestResource(UrlMapping = '/v1/orders/*')
global with sharing class OrdersEndpoint_v1 {

  /**
    * Handles POST request to the leads endpoint
    * 
    * @return String
    */
  @HttpPost
  global static void create() {
    RequestDispatcher.getInstance().dispatch(OrdersCreateHandler.class);
  }
 }
```

## 6. The handle flow
The request is handled by following the chain below:
```
Rest Resource -> Request Dispatcher -> Request Pre-processor ->  Method Handler -> Request Logger -> Response Context Setter -> Rest Resource
```
