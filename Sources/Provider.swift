import Stencil
import PathKit
import Vapor

public class Provider: Vapor.Provider {
    public var renderer: StencilRenderer?

    public func boot(application: Application) {
        let renderer: StencilRenderer

        if let value = self.renderer {
            renderer = value
        } else {
            renderer = StencilRenderer(
                namespace: Namespace(),
                templateLoader: TemplateLoader(paths: [Path(application.viewsDir)])
            )

            self.renderer = renderer
        }

        View.renderers[".stencil"] = renderer
    }

}
