package mx.com.banco.azteca.dataimaxws.spring.config;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import org.jsondoc.core.pojo.JSONDoc;
import org.jsondoc.springmvc.controller.JSONDocController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author Carlos Cuaya Xinto
 */
@Configuration
@ComponentScan(basePackages = {"mx.com.banco.azteca.dataimaxws"})
@EnableWebMvc
public class AppConfig extends WebMvcConfigurerAdapter{
    
    @Autowired
    private ServletContext servletContext;
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
        registry.addResourceHandler("/font/**").addResourceLocations("/font/");
        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
    }
    
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
    
    @Bean
    public JSONDocController jsonDocController() {
        JSONDocController controller = new JSONDocController();
        
        controller.setBasePath(servletContext.getContextPath());
        controller.setVersion("1.0");
        controller.setPackages(getPackages());
        
        return controller;
    }
    
    @Bean
    public JSONDoc jsonDocApi() {
        return jsonDocController().getApi();
    }
    
    private List<String> getPackages() {
        List<String> packages = new ArrayList<>();
        
        packages.add("mx.com.banco.azteca.dataimaxws");
        
        return packages;
    }
        
}
