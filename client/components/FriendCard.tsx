interface FriendCardProps {
  name: string;
  avatarUrl?: string;
}

export default function FriendCard({ name, avatarUrl }: FriendCardProps) {
  return (
    <div className="inline-flex px-2 py-3 justify-center items-center rounded-3xl bg-black">
      <span className="text-white font-playfair text-xs italic font-bold leading-4">
        {name}
      </span>
    </div>
  );
}
