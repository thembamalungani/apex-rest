/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the factory used to create preprocessors
 * @date 2019-09-07
 */
public class RequestPreprocessorFactory {

    /**
     * Gets a preprocessors for the handler, if none defined a default one is returned
     *
     * @param Type type
     * @return IRequestPreprocessor
     */
    public static IRequestPreprocessor getPreprocessorFor(Type type) {
        
        IRequestPreprocessor preprocessor;

        try {

            String preprocessorName = type.getName().replace('Handler', 'Preprocessor');
            preprocessor = (IRequestPreprocessor) Container.getBean(preprocessorName);

        } catch (Exception e) {
            
            preprocessor = (IRequestPreprocessor) Container.getBean(BaseRequestPreprocessor.class);
        }

        return preprocessor;
    }
}
