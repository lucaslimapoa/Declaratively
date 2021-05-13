//
//  ViewBuilder.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import Foundation

@resultBuilder
public struct ViewBuilder {
    public static func buildBlock<V1>(_ v1: V1) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable {
        [AnyUIViewRepresentable(v1)]
    }
    
    public static func buildBlock<V1, V2>(_ v1: V1, _ v2: V2) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                V2: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2)]
    }

    public static func buildBlock<V1, V2, V3>(_ v1: V1, _ v2: V2, _ v3: V3) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                              V2: UIViewRepresentable,
                                                                                                              V3: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2), AnyUIViewRepresentable(v3)]
    }
    
    public static func buildBlock<V1, V2, V3, V4>(_ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                                            V2: UIViewRepresentable,
                                                                                                                            V3: UIViewRepresentable,
                                                                                                                            V4: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2), AnyUIViewRepresentable(v3), AnyUIViewRepresentable(v4)]
    }
    
    public static func buildBlock<V1, V2, V3, V4, V5>(_ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                                                          V2: UIViewRepresentable,
                                                                                                                                          V3: UIViewRepresentable,
                                                                                                                                          V4: UIViewRepresentable,
                                                                                                                                          V5: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2), AnyUIViewRepresentable(v3), AnyUIViewRepresentable(v4), AnyUIViewRepresentable(v5)]
    }
    
    public static func buildBlock<V1, V2, V3, V4, V5, V6>(_ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                                                                        V2: UIViewRepresentable,
                                                                                                                                                        V3: UIViewRepresentable,
                                                                                                                                                        V4: UIViewRepresentable,
                                                                                                                                                        V5: UIViewRepresentable,
                                                                                                                                                        V6: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2), AnyUIViewRepresentable(v3), AnyUIViewRepresentable(v4), AnyUIViewRepresentable(v5), AnyUIViewRepresentable(v6)]
    }
    
    public static func buildBlock<V1, V2, V3, V4, V5, V6, V7>(_ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7) -> [AnyUIViewRepresentable] where V1: UIViewRepresentable,
                                                                                                                                                        V2: UIViewRepresentable,
                                                                                                                                                        V3: UIViewRepresentable,
                                                                                                                                                        V4: UIViewRepresentable,
                                                                                                                                                        V5: UIViewRepresentable,
                                                                                                                                                        V6: UIViewRepresentable,
                                                                                                                                                        V7: UIViewRepresentable {
        [AnyUIViewRepresentable(v1), AnyUIViewRepresentable(v2), AnyUIViewRepresentable(v3), AnyUIViewRepresentable(v4), AnyUIViewRepresentable(v5), AnyUIViewRepresentable(v6), AnyUIViewRepresentable(v7)]
    }
}
