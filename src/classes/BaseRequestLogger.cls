/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is base logger which is used if no custom one is defined
 * @date 2019-09-07
 */
public virtual class BaseRequestLogger implements IHttpRequestLogger {

    /**
     * BaseRequestLogger default constructor
     */
    public BaseRequestLogger() {}

    /**
     * Logs a request
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    public virtual void log(HttpRequest request, HttpResponse response) {}
}
