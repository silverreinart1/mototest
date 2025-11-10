import BottomNav from "@/components/BottomNav";
import FriendCard from "@/components/FriendCard";

export default function Index() {
  const friends = [
    "Alex Johnson",
    "Maria Garcia",
    "David Smith",
    "Sarah Wilson",
    "John Davis",
    "Emma Brown",
  ];

  return (
    <div className="min-h-screen bg-white pb-32">
      <div className="max-w-md mx-auto px-4 pt-6 flex flex-col gap-11">
        {/* Recent Ride Section */}
        <section className="w-full h-32 rounded-3xl bg-black relative p-5">
          <div className="w-60 h-24 rounded-[20px] bg-[#505050]" />
          <button className="absolute bottom-5 right-7 inline-flex px-6 py-3 justify-center items-center rounded-3xl bg-white hover:bg-gray-100 transition-colors">
            <span className="text-black font-playfair text-xs italic font-bold leading-4">
              Ride Again
            </span>
          </button>
        </section>

        {/* Friends Section */}
        <section className="rounded-3xl bg-black p-4">
          <div className="bg-white rounded-lg p-6">
            <div className="grid grid-cols-2 gap-x-14 gap-y-5">
              {friends.map((friend, index) => (
                <FriendCard key={index} name="Profile pic and name" />
              ))}
            </div>
          </div>
        </section>

        {/* Suggestion Section */}
        <section className="w-full h-60 rounded-3xl bg-black" />
      </div>

      <BottomNav />
    </div>
  );
}
