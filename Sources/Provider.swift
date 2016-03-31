import Stencil
import PathKit
import Vapor

extension Application {
  var resourcesDir: String { return workDir + "Resources/" }
  var viewsDir: String { return resourcesDir + "Views/" }
}

public class Provider: Vapor.Provider {
  public static var renderer: StencilRenderer?
  
  public static func boot(application: Application) {
    let renderer: StencilRenderer
    
    if let r = Provider.renderer {
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