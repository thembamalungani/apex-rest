/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for response context setters
 * @date 2019-09-07
 */
public interface IResponseContextSetter {

    /**
     * Sets the response context
     *
     * @param HttpResponse response
     */
    void setContext(HttpResponse response);
}
