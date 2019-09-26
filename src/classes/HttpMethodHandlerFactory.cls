/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the factory used to create http method handlers
 * @date 2019-09-07
 */
public class HttpMethodHandlerFactory {

    /**
     * Attempts to get a instance of the handler by name from the container
     *
     * @param Type type
     * @throws NoMethodHandlerException
     * @return IHttpMethodHandler
     */
    public static IHttpMethodHandler getHandlerFor(Type type) {
        
        try {

            return (IHttpMethodHandler) Container.getBean(type.getName());

        } catch (Exception ex) {

            throw new NoMethodHandlerException();
        }
    }
}
