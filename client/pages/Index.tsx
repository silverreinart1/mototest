import BottomNav from "@/components/BottomNav";
import RecentRideCard from "@/components/RecentRideCard";
import RiderAvatar from "@/components/RiderAvatar";
import RideEventCard from "@/components/RideEventCard";
import { Flame } from "lucide-react";

export default function Index() {
  const friends = [
    { name: "Alex", initials: "AJ", rating: 4.8, active: true },
    { name: "Maria", initials: "MG", rating: 4.9, active: false },
    { name: "David", initials: "DS", rating: 4.6, active: true },
    { name: "Sarah", initials: "SW", rating: 4.7, active: false },
    { name: "John", initials: "JD", rating: 4.5, active: true },
    { name: "Emma", initials: "EB", rating: 5.0, active: false },
  ];

  const upcomingRides = [
    {
      title: "City Thrill Ride",
      location: "Downtown Circuit",
      time: "Tonight 7:00 PM",
      difficulty: "Hard" as const,
      riders: 8,
      distance: "38 km",
    },
    {
      title: "Coastal Cruise",
      location: "Pacific Highway",
      time: "Tomorrow 9:00 AM",
      difficulty: "Medium" as const,
      riders: 12,
      distance: "65 km",
    },
    {
      title: "Mountain Challenge",
      location: "Alpine Pass",
      time: "Sunday 8:00 AM",
      difficulty: "Hard" as const,
      riders: 6,
      distance: "72 km",
    },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-b from-moto-dark via-moto-dark-lighter to-moto-dark pb-32 w-screen overflow-x-hidden">
      {/* Header */}
      <div className="bg-gradient-to-b from-black to-moto-dark pt-5 pb-6 px-4">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-moto-orange text-[10px] font-poppins uppercase tracking-wider font-bold">
              Welcome back, rider
            </p>
            <h1 className="text-white text-2xl font-bold font-poppins">
              MotoRadar
            </h1>
          </div>
          <div className="w-11 h-11 rounded-full bg-gradient-to-br from-moto-orange to-moto-orange-dark flex items-center justify-center shadow-lg flex-shrink-0">
            <Flame className="w-5 h-5 text-white" />
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="w-full px-4 pt-6 space-y-6">
        {/* Recent Ride Section */}
        <div>
          <h2 className="text-white font-poppins font-bold text-sm mb-3 uppercase tracking-wider">
            Your Last Ride
          </h2>
          <RecentRideCard />
        </div>

        {/* Friends Section */}
        <div>
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-white font-poppins font-bold text-sm uppercase tracking-wider">
              Riding Squad
            </h2>
            <span className="text-moto-orange text-xs font-poppins font-bold">
              {friends.length} Riders
            </span>
          </div>
          <div className="grid grid-cols-3 gap-4">
            {friends.map((friend, idx) => (
              <RiderAvatar
                key={idx}
                name={friend.name}
                initials={friend.initials}
                rating={friend.rating}
                isActive={friend.active}
              />
            ))}
          </div>
        </div>

        {/* Upcoming Events Section */}
        <div>
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-white font-poppins font-bold text-sm uppercase tracking-wider">
              Group Rides
            </h2>
            <span className="text-moto-orange text-xs font-poppins font-bold">
              {upcomingRides.length}
            </span>
          </div>
          <div className="space-y-3">
            {upcomingRides.map((ride, idx) => (
              <RideEventCard key={idx} {...ride} />
            ))}
          </div>
        </div>

        {/* Leaderboard teaser */}
        <div className="bg-gradient-to-r from-moto-orange/10 to-moto-accent/10 border border-moto-orange/20 rounded-xl p-4 text-center">
          <p className="text-moto-orange font-poppins font-bold uppercase tracking-wider text-xs mb-1">
            🏆 Top Performer
          </p>
          <h3 className="text-white text-base font-bold font-poppins mb-2">
            Top 15% this month!
          </h3>
          <p className="text-gray-400 text-xs mb-3">
            Keep riding to climb higher
          </p>
          <button className="w-full bg-gradient-to-r from-moto-orange to-moto-orange-dark active:scale-95 text-white font-poppins font-bold py-2 rounded-lg transition-all">
            View Leaderboard
          </button>
        </div>
      </div>

      <BottomNav />
    </div>
  );
}
