/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Defines a contract that classes which handle rest api inbound calls should conform to
 * @date 2019-09-06
 */
public interface IRequestDispatcher {

    /**
     * Handles the http request by delegating the handling to the instance of HttpMethodHandler
     * passed
     *
     * @param Type type
     * @return HttpResponse
     */
    HttpResponse dispatch(Type type);
}
