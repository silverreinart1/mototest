import BottomNav from "@/components/BottomNav";
import FriendCard from "@/components/FriendCard";

export default function Index() {
  return (
    <div className="min-h-screen bg-white pb-32">
      <div className="w-full max-w-[402px] mx-auto flex flex-col items-center gap-[43px] pt-6 px-2">
        {/* Recent Ride Section */}
        <section className="w-full h-[130px] rounded-3xl bg-black relative">
          <div className="absolute left-[21px] top-[18px] w-[241px] h-[95px] rounded-[20px] bg-[#505050]" />
          <button className="absolute right-[11px] bottom-[11px] inline-flex px-[26px] py-3 justify-center items-center rounded-3xl bg-white hover:bg-gray-100 transition-colors">
            <span className="text-black font-playfair text-xs italic font-bold leading-4">
              Ride Again
            </span>
          </button>
        </section>

        {/* Friends Section */}
        <section className="w-full rounded-3xl bg-black px-[17px] py-4">
          <div className="bg-white w-full rounded-sm p-[17px]">
            <div className="grid grid-cols-2 gap-x-[56px] gap-y-5">
              {Array(6).fill(0).map((_, index) => (
                <FriendCard key={index} name="Profile pic and name" />
              ))}
            </div>
          </div>
        </section>

        {/* Suggestion Section */}
        <section className="w-full h-[241px] rounded-3xl bg-black" />
      </div>

      <BottomNav />
    </div>
  );
}
