//
//  FavoriteMovie.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import CoreData

@objc(FavoriteMovies)
public class FavoriteMovies: NSManagedObject, Identifiable {
    @NSManaged public var id: Int
    @NSManaged public var posterURL: URL
}
