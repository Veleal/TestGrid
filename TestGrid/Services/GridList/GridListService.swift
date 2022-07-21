//
//  CoolListService.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation

public final class GridListService: Shareable {
  
  public static let shared = GridListService()
  
  public func gridItems() -> [String] {
    return ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.",
            "Some text",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec adipiscing tristique risus nec feugiat. Volutpat lacus laoreet non curabitur gravida arcu ac.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Varius quam quisque id diam vel quam. Adipiscing tristique risus nec feugiat. Sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Quam viverra orci sagittis eu volutpat odio facilisis.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Another text",
            "lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna et pharetra pharetra massa massa ultricies. Laoreet suspendisse interdum consectetur libero. Rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Arcu vitae elementum curabitur vitae nunc. Scelerisque felis imperdiet proin fermentum leo vel orci porta non.",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    ]
  }
}
