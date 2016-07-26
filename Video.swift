//
//  Video.swift
//  REAUCMTV
//
//  Created by Alberto Banet Masa on 7/7/16.
//  Copyright © 2016 UCM. All rights reserved.
//

import Foundation
import CoreMedia

enum ElementType {
  case Collection
  case MovingImage
}

class Video {
  var ucIdentifier: String!
  var title: String!
  var description: String!
  var type: String!
  var miniatura: Photo?
  var urlVideo: NSURL!
  var identifierIOS: String!
  
  // Variables para mantener la duración total del vídeo y el tiempo que se ha visualizado ya.
  // Estas variables se guardarán en local y se utilizarán para dibujar la barra indicativa de posición de vídeo.
  var tiempoTotalVideoEnSegundos: Int64?
  var tiempoTranscurridoVideoEnSegundos: Int64?
  
  
  init(fromJson json: JSON!){
    guard json != nil else {
      return
    }
    ucIdentifier  = json["uc.identifier"].stringValue
    title         = json["dc.title"].stringValue
    description   = json["dc.description"].stringValue
    type          = json["dc.type"].stringValue
    
    // Obtenemos la url para iOS
    let urlsRecurso = json["dc.identifier"].object
    identifierIOS = urlsRecurso["uc.ios"] as! String
    
    urlVideo = NSURL(string: reaAPI.baseURLStringVideos + identifierIOS + reaAPI.finURLStringVideos)
    
    // Establecemos la imagen miniatura
    miniatura = Photo(photoID: "miniatura_" + ucIdentifier + ".png", remoteURL: NSURL(string: reaAPI.baseURLImagenes + "miniatura_\(ucIdentifier).png")!)
  }
  
  
}