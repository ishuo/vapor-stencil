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
            renderer = self.makeRenderer(with: application)
            self.renderer = renderer
        }

        View.renderers[".stencil"] = renderer
    }

    public func makeRenderer(with app: Application) -> StencilRenderer {
        return StencilRenderer(
            namespace: Namespace(),
            templateLoader: TemplateLoader(paths: [Path(app.viewsDir)])
        )
    }

}
