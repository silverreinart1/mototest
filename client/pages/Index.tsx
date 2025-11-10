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
    <div className="min-h-screen bg-gradient-to-b from-moto-dark via-moto-dark-lighter to-moto-dark pb-32">
      {/* Header */}
      <div className="bg-gradient-to-b from-black to-moto-dark pt-6 pb-8">
        <div className="max-w-4xl mx-auto px-4">
          <div className="flex items-center justify-between mb-2">
            <div>
              <p className="text-moto-orange text-xs font-poppins uppercase tracking-widest font-bold">
                Welcome back, rider
              </p>
              <h1 className="text-white text-3xl font-bold font-poppins">
                MotoRadar
              </h1>
            </div>
            <div className="w-12 h-12 rounded-full bg-gradient-to-br from-moto-orange to-moto-orange-dark flex items-center justify-center shadow-lg">
              <Flame className="w-6 h-6 text-white" />
            </div>
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="max-w-4xl mx-auto px-4 pt-8 space-y-8">
        {/* Recent Ride Section */}
        <div>
          <h2 className="text-white font-poppins font-bold text-lg mb-4 uppercase tracking-wide">
            Your Last Ride
          </h2>
          <RecentRideCard />
        </div>

        {/* Friends Section */}
        <div>
          <div className="flex items-center justify-between mb-5">
            <h2 className="text-white font-poppins font-bold text-lg uppercase tracking-wide">
              Riding Squad
            </h2>
            <span className="text-moto-orange text-xs font-poppins font-bold">
              {friends.length} Riders
            </span>
          </div>
          <div className="grid grid-cols-2 sm:grid-cols-3 gap-6">
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
          <div className="flex items-center justify-between mb-5">
            <h2 className="text-white font-poppins font-bold text-lg uppercase tracking-wide">
              Upcoming Group Rides
            </h2>
            <span className="text-moto-orange text-xs font-poppins font-bold">
              {upcomingRides.length} Events
            </span>
          </div>
          <div className="grid gap-4">
            {upcomingRides.map((ride, idx) => (
              <RideEventCard key={idx} {...ride} />
            ))}
          </div>
        </div>

        {/* Leaderboard teaser */}
        <div className="bg-gradient-to-r from-moto-orange/10 to-moto-accent/10 border border-moto-orange/20 rounded-2xl p-6 text-center group hover:border-moto-orange/50 transition-all">
          <p className="text-moto-orange font-poppins font-bold uppercase tracking-wider text-sm mb-2">
            🏆 Top Performer
          </p>
          <h3 className="text-white text-lg font-bold font-poppins mb-2">
            You're in the top 15% this month!
          </h3>
          <p className="text-gray-400 text-sm mb-4">
            Keep riding and climb the leaderboard
          </p>
          <button className="bg-gradient-to-r from-moto-orange to-moto-orange-dark hover:shadow-lg hover:shadow-moto-orange/50 text-white font-poppins font-bold px-6 py-2 rounded-lg transition-all transform hover:scale-105">
            View Leaderboard
          </button>
        </div>
      </div>

      <BottomNav />
    </div>
  );
}
