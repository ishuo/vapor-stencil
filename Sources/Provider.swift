import Stencil
import PathKit
import Vapor

public class Provider: Vapor.Provider {
    public static func boot(application: Application) {
        View.renderers[".stencil"] = StencilRenderer( namespace: Namespace(),
                                                      templateLoader: TemplateLoader(paths: [Path(application.workDir + "Resources/")]))
    }
    
}