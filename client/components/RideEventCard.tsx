import { Users, MapPin, Clock } from "lucide-react";

interface RideEventCardProps {
  title: string;
  location: string;
  time: string;
  difficulty: "Easy" | "Medium" | "Hard";
  riders: number;
  distance: string;
}

export default function RideEventCard({
  title,
  location,
  time,
  difficulty,
  riders,
  distance,
}: RideEventCardProps) {
  const difficultyColors = {
    Easy: "bg-green-500/20 text-green-700",
    Medium: "bg-yellow-500/20 text-yellow-700",
    Hard: "bg-red-500/20 text-red-700",
  };

  return (
    <div className="group relative overflow-hidden rounded-2xl bg-gradient-to-br from-moto-charcoal to-moto-dark shadow-xl hover:shadow-2xl transition-all duration-300 hover:scale-105">
      {/* Accent border */}
      <div className="absolute inset-0 border-l-4 border-moto-orange opacity-0 group-hover:opacity-100 transition-opacity" />

      {/* Background accent */}
      <div className="absolute -top-20 -right-20 w-40 h-40 bg-moto-orange/5 rounded-full blur-3xl group-hover:bg-moto-orange/10 transition-all" />

      {/* Content */}
      <div className="relative p-4">
        <div className="flex justify-between items-start mb-3">
          <div>
            <h3 className="text-white font-bold font-poppins text-sm leading-tight mb-1">
              {title}
            </h3>
            <div className="flex items-center gap-2">
              <MapPin className="w-3 h-3 text-moto-orange" />
              <p className="text-xs text-gray-400">{location}</p>
            </div>
          </div>
          <span
            className={`px-2 py-1 rounded text-xs font-bold font-poppins ${
              difficultyColors[difficulty]
            }`}
          >
            {difficulty}
          </span>
        </div>

        {/* Stats row */}
        <div className="grid grid-cols-3 gap-2 py-3 border-t border-gray-700/50">
          <div className="flex items-center gap-1.5">
            <Clock className="w-3.5 h-3.5 text-moto-accent" />
            <span className="text-[10px] text-gray-300">{time}</span>
          </div>
          <div className="flex items-center gap-1.5">
            <Users className="w-3.5 h-3.5 text-moto-accent" />
            <span className="text-[10px] text-gray-300">{riders} riders</span>
          </div>
          <div className="text-[10px] text-gray-300">{distance}</div>
        </div>

        {/* Join button */}
        <button className="w-full mt-3 bg-moto-orange hover:bg-moto-orange-dark text-white font-poppins font-semibold text-xs py-2 rounded-lg transition-colors shadow-lg">
          Join Ride
        </button>
      </div>
    </div>
  );
}
