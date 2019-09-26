/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for request pre processors.
 *  This can be something like data santisation, field mapping, etc.
 * @date 2019-09-07
 */
public interface IRequestPreprocessor {

    /**
     * Translates the request
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    HttpRequest process(HttpRequest request);
}
