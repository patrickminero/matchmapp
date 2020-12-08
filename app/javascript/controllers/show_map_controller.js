import { Controller } from "stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static targets = [ 'map' ];
  connect() { 
  this.initMapbox();
}

  initMapbox() {
    try {
      mapboxgl.accessToken = this.mapTarget.dataset.mapboxApiKey;

      this.map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10'
      });
      this.addMarkers();
    } catch (error) {
      console.log(error)
    }
  } 

  addMarkers() {
    const marker = JSON.parse(this.mapTarget.dataset.marker);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map);
      
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ marker.lng, marker.lat ]);
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
  
}