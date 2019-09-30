# apex-inbound-rest
<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

This is a simple Apex inbound rest api. Takes care of the low level details of defining logging, request sanitisation and allows you to focus on the details of your application.

Usage

```apex
public class OrdersCreateHandler extends BaseHttpMethodHandler {

  public HttpResponse handle(HttpRequest request) {
    // Handle the request
    return new HttpResponse();
  }
}

// This wound typically go into a Rest Resource method
RequestDispatcher.getInstance().dispatch(OrdersCreateHandler.class);
```
