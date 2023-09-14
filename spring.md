# Spring Framework

 ## 1. IOC(Inversion of Control)
 
 - Process whereby objects define their dependencies (that is, the other objects they work with) through 
    1. constructor arguments
    2. arguments to a factory method
    3. properties that are set on the object instance after it is constructed or returned from a factory method
 - Container injects those dependencies when it creates the bean
 - This process is fundamentally the inverse (hence the name, Inversion of Control) of the bean itself controlling the instantiation or location of its dependencies by using direct construction of classes or a mechanism such as the Service Locator pattern.
 - The BeanFactory provides the configuration framework and basic functionality, and the ApplicationContext adds more enterprise-specific functionality.
 
## 2. ApplicationContext

- *The org.springframework.context.ApplicationContext* interface represents the Spring IoC container and is responsible for instantiating, configuring, and assembling the beans. 
- Container gets its instructions on what objects to instantiate, configure, and assemble by reading configuration metadata
- Configuration metadata is represented in XML, Java annotations, or Java code

### How Spring works 
![Link Name](https://docs.spring.io/spring-framework/docs/5.3.29/reference/html/images/container-magic.png)  

## 3. Bean

- IoC container manages one or more beans
- Created with configuration metadata thay you supply to the container.
- The bean definition contains information on how to create a specific bean.

## 4. Dependency Injection

- Clean code
- Decoupling is more effective
- Two variants
    1. Constructor based Dependency Injection
    2. Setter-based Dependency Injection
- Use constructors for mandatory dependencies and setter methods or configuration methods for optional dependencies

## 5. Dependency Resolution Process

- The ApplicationContext is created and initialized with configuration metadata that describes all the beans. Configuration metadata can be specified by XML, Java code, or annotations.

- For each bean, its dependencies are expressed in the form of properties, constructor arguments, or arguments to the static-factory method (if you use that instead of a normal constructor). These dependencies are provided to the bean, when the bean is actually created.

- Each property or constructor argument is an actual definition of the value to set, or a reference to another bean in the container.

- Each property or constructor argument that is a value is converted from its specified format to the actual type of that property or constructor argument. By default, Spring can convert a value supplied in string format to all built-in types, such as int, long, String, boolean, and so forth.

> **Circular Dependency**
    If you use predominantly constructor injection, it is possible to create an unresolvable circular dependency scenario.
For example: Class A requires an instance of class B through constructor injection, and class B requires an instance of class A through constructor injection. If you configure beans for classes A and B to be injected into each other, the Spring IoC container detects this circular reference at runtime, and throws a BeanCurrentlyInCreationException.
One possible solution is to edit the source code of some classes to be configured by setters rather than constructors. Alternatively, avoid constructor injection and use setter injection only. In other words, although it is not recommended, you can configure circular dependencies with setter injection.
Unlike the typical case (with no circular dependencies), a circular dependency between bean A and bean B forces one of the beans to be injected into the other prior to being fully initialized itself (a classic chicken-and-egg scenario).

## 6. Autowiring Collaborators

- Spring resolve collaborators (other beans) automatically for your bean by inspecting the contents of the ApplicationContext
    1. Reduces the need to specify properties or constructor arguments
    2. Autowiring can update a configuration as uour object 

