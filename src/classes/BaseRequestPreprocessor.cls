/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the base request preprocessor used when no custom one is defined
 * @date 2019-09-07
 */
public virtual class BaseRequestPreprocessor implements IRequestPreprocessor {

    /**
     * BaseRequestPreprocessor default constructor
     */
    public BaseRequestPreprocessor() {}

    /**
     * Pre processes a requests
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    public virtual HttpRequest process(HttpRequest request) {
        
        return request;
    }
}
