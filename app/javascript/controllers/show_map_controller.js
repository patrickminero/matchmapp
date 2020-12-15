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
    const bounds = new mapboxgl.LngLatBounds();
    const markers = JSON.parse(this.mapTarget.dataset.markers);
    markers.forEach( (marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      new mapboxgl.Marker()
            .setLngLat([ marker.lng, marker.lat ])
            .setPopup(popup)
            .addTo(this.map);
      bounds.extend([ marker.lng, marker.lat ]);
    })
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}