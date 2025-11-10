import { Star } from "lucide-react";

interface RiderAvatarProps {
  name: string;
  initials: string;
  rating: number;
  isActive?: boolean;
}

export default function RiderAvatar({
  name,
  initials,
  rating,
  isActive = false,
}: RiderAvatarProps) {
  const colors = [
    "bg-gradient-to-br from-red-500 to-red-700",
    "bg-gradient-to-br from-orange-500 to-orange-700",
    "bg-gradient-to-br from-yellow-500 to-yellow-700",
    "bg-gradient-to-br from-blue-500 to-blue-700",
    "bg-gradient-to-br from-purple-500 to-purple-700",
    "bg-gradient-to-br from-pink-500 to-pink-700",
  ];

  const colorIndex = initials.charCodeAt(0) % colors.length;

  return (
    <div className="flex flex-col items-center gap-2">
      <div className="relative">
        {/* Avatar circle */}
        <div
          className={`w-16 h-16 rounded-full ${colors[colorIndex]} flex items-center justify-center text-white font-bold text-lg shadow-lg border-2 ${
            isActive ? "border-moto-accent" : "border-moto-orange"
          } transition-all hover:shadow-xl hover:scale-110`}
        >
          {initials}
        </div>

        {/* Online indicator */}
        {isActive && (
          <div className="absolute bottom-0 right-0 w-4 h-4 bg-green-500 rounded-full border-2 border-white shadow-md" />
        )}

        {/* Rating star */}
        <div className="absolute -top-1 -right-1 bg-moto-orange rounded-full p-1 shadow-md">
          <Star className="w-3 h-3 text-white fill-white" />
        </div>
      </div>

      <div className="text-center">
        <p className="text-xs font-poppins font-semibold text-gray-900 truncate w-16">
          {name}
        </p>
        <div className="flex items-center justify-center gap-0.5 mt-0.5">
          <Star className="w-2.5 h-2.5 text-moto-orange fill-moto-orange" />
          <span className="text-[10px] font-poppins font-bold text-moto-orange">
            {rating.toFixed(1)}
          </span>
        </div>
      </div>
    </div>
  );
}
