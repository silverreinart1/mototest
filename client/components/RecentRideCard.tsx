import { Zap, Navigation2, Clock } from "lucide-react";

export default function RecentRideCard() {
  return (
    <div className="w-full">
      {/* Card with shadow and depth */}
      <div className="bg-gradient-to-br from-moto-orange to-moto-orange-dark rounded-2xl overflow-hidden shadow-xl active:shadow-lg transition-shadow">
        {/* Header with gradient overlay */}
        <div className="relative h-32 bg-gradient-to-b from-black/30 to-black/60 overflow-hidden">
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
          <div className="relative h-full flex flex-col justify-between p-4">
            <div>
              <p className="text-white/80 text-[11px] font-poppins uppercase tracking-wider">
                Last Ride
              </p>
              <h3 className="text-white text-lg font-bold font-poppins mt-0.5">
                Mountain Loop
              </h3>
            </div>

            {/* Stats grid */}
            <div className="grid grid-cols-3 gap-2">
              <div className="bg-black/40 backdrop-blur rounded-lg p-1.5">
                <div className="flex items-center gap-0.5 mb-0.5">
                  <Navigation2 className="w-3 h-3 text-moto-accent" />
                  <span className="text-white/60 text-[9px]">Distance</span>
                </div>
                <p className="text-white font-bold text-xs">42.5 km</p>
              </div>
              <div className="bg-black/40 backdrop-blur rounded-lg p-1.5">
                <div className="flex items-center gap-0.5 mb-0.5">
                  <Zap className="w-3 h-3 text-moto-accent" />
                  <span className="text-white/60 text-[9px]">Speed</span>
                </div>
                <p className="text-white font-bold text-xs">78 km/h</p>
              </div>
              <div className="bg-black/40 backdrop-blur rounded-lg p-1.5">
                <div className="flex items-center gap-0.5 mb-0.5">
                  <Clock className="w-3 h-3 text-moto-accent" />
                  <span className="text-white/60 text-[9px]">Time</span>
                </div>
                <p className="text-white font-bold text-xs">32 min</p>
              </div>
            </div>
          </div>
        </div>

        {/* Action button */}
        <div className="bg-black/20 backdrop-blur px-4 py-3 flex justify-between items-center gap-3">
          <span className="text-white font-poppins font-semibold text-xs">
            Ready for another?
          </span>
          <button className="bg-white text-moto-orange active:bg-gray-100 transition-colors px-5 py-1.5 rounded-full font-bold font-poppins text-xs shadow-lg flex-shrink-0">
            Ride Again
          </button>
        </div>
      </div>
    </div>
  );
}
