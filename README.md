# apex-inbound-rest
<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

This is a simple Apex inbound rest api. Takes care of the low level details of defining logging, request sanitisation and allows you to focus on the details of your application.

Usage

## 1. Define a Http Request method handler class which extends BaseHttpMethodHandler or implements 
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
}
```

The http method handler defines 2 methods `complete` which is called when the request is processed succsessfully and `fail` which is called when the request failed to process for some reason.

## 2. Define a request pre-processor. You would typically use this to perform some data sanitisation.
The request pre-processor is optional but if defined, it should extend `BaseRequestPreprocessor` or implement `IRequestPreprocessor`. The naming of this is important. If you have a method handler named `OrdersCreateHandler` then you would need to name this `OrdersCreatePreprocessor` which the dispatcher will attempt to instantiated and call dynamically if it is defined.

## 3. Define a request Context Setter.
This is optional. The request context setter is used to set the response context. You would typically use this to set custom response headers, response code, response data. The naming is important. If you named your method handler `OrdersCreateHandler`, then your context setter must be named `OrdersCreateResponseContextSetter` which will be instatiated and called dynamically if it is defined.

## 4. Dispatch the method handler to the request handle dispatch
This would typically go into a Rest Resource method
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

## 5. The handler chain
The request is handled by following the chain below:
```
Rest Resource -> Request Dispatcher -> Request Pre-processor ->  Method Handler -> Response Context Setter -> Rest Resource
```
