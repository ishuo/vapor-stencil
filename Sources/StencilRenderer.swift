import Stencil
import Vapor

public class StencilRenderer: RenderDriver {
    public let namespace: Namespace
    public let templateLoader: TemplateLoader
    
    public init(namespace: Namespace = Namespace(), templateLoader: TemplateLoader) {
        self.namespace = namespace
        self.templateLoader = templateLoader
    }
    
    public func render(template template: String, context: [String: Any]) throws -> String {
        let c = Context(dictionary: context, namespace: self.namespace)
        c["loader"] = self.templateLoader
        
        let template = Template(templateString: template)
        return try template.render(c)
    }
    
}
