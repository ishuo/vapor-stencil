import Stencil
import PathKit
import Vapor

public class Provider: Vapor.Provider {
    public let renderer: StencilRenderer

    public init(renderer: StencilRenderer = StencilRenderer()) {
        self.renderer = renderer
    }

    public func boot(application: Application) {
        if renderer.templateLoader == nil {
            renderer.templateLoader = TemplateLoader(paths: [Path(application.viewsDir)])
        }

        View.renderers[".stencil"] = renderer
    }

}
