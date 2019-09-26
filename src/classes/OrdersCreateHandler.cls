/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This processes lead service requests
 * @date 2019-09-06
 */
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
