import Stencil
import PathKit
import Vapor


public class Provider: Vapor.Provider {
  public var renderer: StencilRenderer?
  
  public func boot(application: Application) {
    let renderer: StencilRenderer
    
    if let r = renderer {
      renderer = r
    } else {
      renderer = StencilRenderer(
        namespace: Namespace(),
        templateLoader: TemplateLoader(paths: [Path(application.viewsDir)])
      )
    }
    
    View.renderers[".stencil"] = renderer
  }
  
}