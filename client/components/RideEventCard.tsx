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
    <div className="relative overflow-hidden rounded-xl bg-gradient-to-br from-moto-charcoal to-moto-dark shadow-lg active:shadow-md transition-shadow">
      {/* Accent border */}
      <div className="absolute inset-0 border-l-3 border-moto-orange pointer-events-none" />

      {/* Background accent */}
      <div className="absolute -top-16 -right-16 w-32 h-32 bg-moto-orange/5 rounded-full blur-2xl pointer-events-none" />

      {/* Content */}
      <div className="relative p-3">
        <div className="flex justify-between items-start mb-2">
          <div className="flex-1">
            <h3 className="text-white font-bold font-poppins text-xs leading-snug mb-1">
              {title}
            </h3>
            <div className="flex items-center gap-1.5">
              <MapPin className="w-3 h-3 text-moto-orange flex-shrink-0" />
              <p className="text-[10px] text-gray-400 truncate">{location}</p>
            </div>
          </div>
          <span
            className={`px-1.5 py-0.5 rounded text-[9px] font-bold font-poppins ml-2 flex-shrink-0 ${
              difficultyColors[difficulty]
            }`}
          >
            {difficulty}
          </span>
        </div>

        {/* Stats row */}
        <div className="grid grid-cols-3 gap-2 py-2 border-t border-gray-700/30 text-[9px]">
          <div className="flex items-center gap-1">
            <Clock className="w-3 h-3 text-moto-accent flex-shrink-0" />
            <span className="text-gray-300 truncate">{time}</span>
          </div>
          <div className="flex items-center gap-1">
            <Users className="w-3 h-3 text-moto-accent flex-shrink-0" />
            <span className="text-gray-300 truncate">{riders}R</span>
          </div>
          <div className="text-gray-300 truncate">{distance}</div>
        </div>

        {/* Join button */}
        <button className="w-full mt-2 bg-moto-orange active:bg-moto-orange-dark text-white font-poppins font-semibold text-xs py-1.5 rounded transition-colors shadow-md">
          Join
        </button>
      </div>
    </div>
  );
}
