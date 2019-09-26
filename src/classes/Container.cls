/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the container. It is responsible for handling dependacies
 * @date 2019-09-06
 */
public class Container {
    
    /**
     * Used when a bean exception is thrown
     * @param String INVALID_BEAN_EXCEPTION
     */
    public static final String INVALID_BEAN_EXCEPTION = 'Invalid bean: %s, please ensure you have a defined bean with default constructor';
    
    /**
     * @author Themba Malungani <themba.clarence@gmail.com>
     * @description Thrown when no bean is registered
     * @date 2019-09-07
     */
    public class InvalidBeanException extends Exception{}

    /**
     * These are the bean bindings. The binding takes the form:
     * beanName => instance
     */
    public static final Map<String, Object> BINDINGS = new Map<String, Object>{
        OrdersCreateHandler.class.getName() => new OrdersCreateHandler()
    };

    /**
     * Bind a bean name to an instance
     *
     * @param String name
     * @throws InvalidBeanException
     * @param bean
     */
    public static void bind(String name, Object bean) {

        if ( bean instanceof String ) {
            
            bean = createBean((String)bean);
        }

        assertBean(bean, String.valueOf(bean).split(':')[0]);

        BINDINGS.put(name, bean);
    }

    /**
     * Fetches a bean from the bindings by name
     * 
     * @param String name
     * @throws NoBeanException
     * @return Object
     */
    public static Object getBean(String name) {

        Object bean = BINDINGS.get(name.trim());

        if ( bean == null ) {

            bean = createBean(name);
            
            bind(name, bean);
        }

        assertBean(bean, name);

        return bean;
    }

    /**
     * Fetches a bean from the bindings by typerese 
     * 
     * @param Type type
     * @throws NoBeanException
     * @return Object
     */
    public static Object getBean(Type type) {

        Object bean = BINDINGS.get(type.getName());
        
        if ( bean == null ) {
            
            bean = createBean(type.getName());

            bind(type.getName(), bean);
        }

        return bean;
    }

    /**
     * Creates a bean by dyamically creating an instance of the class passed
     *
     * @param String name
     * @return Object
     */
    public static Object createBean(String name) {

        Object bean;

        try {

            bean = Type.forName(name).newInstance();      

        } catch(Exception e) {

            bean = null;
        }

        return bean;
    }

    /**
     * Asserts that the passed bean is not null
     *
     * @param Object bean
     * @param String name
     * @throws Container.InvalidBeanException
     */
    public static void assertBean(Object bean, String name) {

        if ( bean == null ) {

            String message = String.format(INVALID_BEAN_EXCEPTION, new String[]{ name });
            throw new Container.InvalidBeanException(message);
        }
    }
}
