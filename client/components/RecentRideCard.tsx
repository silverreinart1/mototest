import { Zap, Navigation2, Clock } from "lucide-react";

export default function RecentRideCard() {
  return (
    <div className="w-full group">
      {/* Card with shadow and depth */}
      <div className="bg-gradient-to-br from-moto-orange to-moto-orange-dark rounded-3xl overflow-hidden shadow-2xl hover:shadow-moto-orange/50 transition-all duration-300 transform hover:scale-105">
        {/* Header with gradient overlay */}
        <div className="relative h-40 bg-gradient-to-b from-black/30 to-black/60 overflow-hidden">
          {/* Motorcycle silhouette background */}
          <div className="absolute inset-0 flex items-center justify-center opacity-10">
            <svg
              className="w-32 h-32"
              viewBox="0 0 24 24"
              fill="none"
              stroke="white"
              strokeWidth="0.5"
            >
              <path d="M3 12c0 6.627 2.686 12 6 12s6-5.373 6-12S12.314 0 9 0 3 5.373 3 12z" />
              <path d="M15 12c0 6.627 2.686 12 6 12s6-5.373 6-12-2.686-12-6-12-6 5.373-6 12z" />
            </svg>
          </div>

          {/* Stats overlay */}
          <div className="relative h-full flex flex-col justify-between p-5">
            <div>
              <p className="text-white/80 text-xs font-poppins uppercase tracking-wider">
                Last Ride
              </p>
              <h3 className="text-white text-xl font-bold font-poppins mt-1">
                Mountain Loop
              </h3>
            </div>

            {/* Stats grid */}
            <div className="grid grid-cols-3 gap-3">
              <div className="bg-black/40 backdrop-blur rounded-lg p-2">
                <div className="flex items-center gap-1 mb-1">
                  <Navigation2 className="w-3.5 h-3.5 text-moto-accent" />
                  <span className="text-white/60 text-[10px]">Distance</span>
                </div>
                <p className="text-white font-bold text-sm">42.5 km</p>
              </div>
              <div className="bg-black/40 backdrop-blur rounded-lg p-2">
                <div className="flex items-center gap-1 mb-1">
                  <Zap className="w-3.5 h-3.5 text-moto-accent" />
                  <span className="text-white/60 text-[10px]">Avg Speed</span>
                </div>
                <p className="text-white font-bold text-sm">78 km/h</p>
              </div>
              <div className="bg-black/40 backdrop-blur rounded-lg p-2">
                <div className="flex items-center gap-1 mb-1">
                  <Clock className="w-3.5 h-3.5 text-moto-accent" />
                  <span className="text-white/60 text-[10px]">Duration</span>
                </div>
                <p className="text-white font-bold text-sm">32 min</p>
              </div>
            </div>
          </div>
        </div>

        {/* Action button */}
        <div className="bg-black/20 backdrop-blur px-5 py-4 flex justify-between items-center">
          <span className="text-white font-poppins font-semibold text-sm">
            Ready for another?
          </span>
          <button className="bg-white text-moto-orange hover:bg-moto-accent transition-colors px-6 py-2 rounded-full font-bold font-poppins text-sm shadow-lg">
            Ride Again
          </button>
        </div>
      </div>
    </div>
  );
}
