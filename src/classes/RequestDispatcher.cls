/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the handler for lead REST API
 * @date 2019-09-06
 */
public class RequestDispatcher implements IRequestDispatcher {
    
    public static RequestDispatcher instance;

    /**
     * HttpHandler default constructor
     */
    private RequestDispatcher() {}

    /**
     * Returns an instance of RequestDispatcher
     *
     * @return   RequestDispatcher
     */
    public static RequestDispatcher getInstance() {

        if ( instance == null ) {
            
            instance = new RequestDispatcher();
        }

        return instance;
    }

    /**
     * Handles the http request by sdelegating the handling to the instance of HttpRouteHandler
     * passed
     *
     * @param Type type
     * @return HttpResponse
     */
    public HttpResponse dispatch(Type type) {

        HttpRequest request = RequestFactory.getRequestFor(type);
        IHttpMethodHandler handler = HttpMethodHandlerFactory.getHandlerFor(type);
        IResponseContextSetter contextSetter = ResponseContextSetterFactory.getResponseContextSetterFor(type);
        HttpResponse response = handler.handle(request);

        contextSetter.setContext(response);
        
        this.done(handler, request, response);

        return response;
    }

    /**
     * Handles response by calling relavant method based on the request status
     *
     * @param IHttpMethodHandler handler
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public void done(IHttpMethodHandler handler, HttpRequest request, HttpResponse response) {

        if ( response.isSuccess() ) {

            handler.complete(request, response);
            
        } else {

            handler.fail(request, response);
        }
    }
}
