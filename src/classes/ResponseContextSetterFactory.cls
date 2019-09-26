/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This factory used to create response context setter 
 * @date 2019-09-06
 */
public class ResponseContextSetterFactory {
    
    /**
     * Gets a logger for the handler, if none defined, a default one is returned
     *
     * @param String handlerName
     * @return IResponseContextSetter
     */
    public static IResponseContextSetter getResponseContextSetterFor(Type type) {
        
        IResponseContextSetter setter;

        try {

            String setterName = type.getName().replace('Handler', 'ResponseContextSetter');
            setter = (IResponseContextSetter) Container.getBean(setterName);

        } catch (Exception e) {

            setter = (IResponseContextSetter) Container.getBean(BaseResponseContextSetter.class.getName());
        }

        return setter;
    }
}
